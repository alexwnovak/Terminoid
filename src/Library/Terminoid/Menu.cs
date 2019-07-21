using System;
using System.Linq;
using Terminoid.Core;

namespace Terminoid
{
   public class Menu
   {
      public string[] Items { get; }
      public int SelectedIndex { get; private set; }

      public int Width { get; private set; }
      public int Height { get; private set; }
      public char SelectionIndicator { get; set; } = '*';

      private Region _region;
      private RegionContext _regionContext;

      private readonly int _maxDisplayItems = 10;
      private bool _hasOverflowContent;
      private int _indexOffset;

      public Menu( object[] items )
      {
         Items = items.Select( i => i.ToString() ).ToArray() ?? throw new ArgumentNullException( nameof( items ) );
      }

      private Region CreateRegion( int width, int height, string[] items )
      {
         _region = new Region( width, height );
         _regionContext = new RegionContext( _region );

         _regionContext.Fill( Color.White, Color.DarkRed );

         int drawHeight = items.Length >= height ? height : items.Length;

         for ( int y = 0; y < drawHeight; y++ )
         {
            _regionContext.SetLine( y, $"   {items[y]}" );
         }

         _regionContext.Set( 1, SelectedIndex, SelectionIndicator, Color.White, Color.DarkRed );

         return _region;
      }

      private void UpdateRegion()
      {
         for ( int y = 0; y < Height; y++ )
         {
            char indicatorOrBlank = SelectedIndex == y + _indexOffset ? SelectionIndicator : ' ';
            _regionContext.Set( 1, y, indicatorOrBlank, Color.White, Color.DarkRed );
         }
      }

      private void ScrollItems( int rows )
      {
         _indexOffset += rows;

         if ( _indexOffset + _maxDisplayItems >= Items.Length )
         {
            _indexOffset = Items.Length - _maxDisplayItems;
         }

         for ( int y = 0; y < Height; y++ )
         {
            char indicatorOrBlank = SelectedIndex == y ? SelectionIndicator : ' ';
            _regionContext.SetLine( y, $" {indicatorOrBlank} {Items[y + _indexOffset]}" );
         }
      }

      public int Show( int x, int y )
      {
         int longestItem = Items.Max( i => i.ToString().Length );
         Width = longestItem + 6;
         Height = _maxDisplayItems;
         _hasOverflowContent = Items.Length > _maxDisplayItems;

         var underRegion = ConsoleContext.Read( x, y, Width, Height );

         CreateRegion( Width, Height, Items );

         ConsoleContext.Write( _region, x, y );

         bool exit = false;
         bool cancel = false;

         while ( true )
         {
            var key = Console.ReadKey( true );

            switch ( key.Key )
            {
               case ConsoleKey.Escape:
                  exit = true;
                  cancel = true;
                  break;
               case ConsoleKey.DownArrow:
                  OnDownArrow();
                  break;
               case ConsoleKey.UpArrow:
                  OnUpArrow();
                  break;
               case ConsoleKey.Enter:
                  exit = true;
                  break;
            }

            if ( exit )
            {
               break;
            }

            UpdateRegion();
            ConsoleContext.Write( _region, x, y );
         }

         ConsoleContext.Write( underRegion, x, y );

         if ( cancel )
         {
            return -1;
         }

         return SelectedIndex;
      }

      private void OnDownArrow()
      {
         if ( _hasOverflowContent )
         {
            if ( SelectedIndex + 1 < Items.Length )
            {
               SelectedIndex++;
            }

            if ( SelectedIndex >= _maxDisplayItems )
            {
               ScrollItems( 1 );
            }
         }
         else
         {
            SelectedIndex = ( SelectedIndex + 1 ) % Items.Length;
         }
      }

      private void OnUpArrow()
      {
         if ( _hasOverflowContent )
         {
            if ( SelectedIndex - 1 >= 0 )
            {
               SelectedIndex--;
            }

            if ( SelectedIndex - _indexOffset > _maxDisplayItems )
            {
               ScrollItems( -1 );
            }
         }
         else
         {
            SelectedIndex = ( SelectedIndex + Items.Length - 1 ) % Items.Length;
         }
      }
   }
}
