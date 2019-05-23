using System;
using System.Linq;
using Terminoid.Native;

namespace Terminoid
{
   public class Menu
   {
      public object[] Items { get; }
      public int SelectedIndex { get; private set; }

      public int Width { get; private set; }
      public int Height { get; private set; }
      public char SelectionIndicator { get; set; } = '*';

      private Region _region;
      private RegionContext _regionContext;

      public Menu( object[] items )
      {
         Items = items ?? throw new ArgumentNullException( nameof( items ) );
      }

      private Region CreateRegion( int width, int height, string[] items )
      {
         _region = new Region( width, height );
         _regionContext = new RegionContext( _region );

         for ( int y = 0; y < _region.Height; y++ )
         {
            _regionContext.FloodAttrLine( y, 8 << 4 | 15 );
            _regionContext.FloodCharLine( y, ' ' );
            _regionContext.SetLine( y, $"   {items[y]}" );
         }

         _regionContext.SetChar( 1, SelectedIndex, SelectionIndicator );

         return _region;
      }

      private void UpdateRegion()
      {
         for ( int y = 0; y < Height; y++ )
         {
            char indicatorOrBlank = SelectedIndex == y ? SelectionIndicator : ' ';
            _regionContext.FloodCharLine( y, ' ' );
            _regionContext.SetLine( y, $" {indicatorOrBlank} {Items[y + _indexOffset]}" );
         }
      }

      public int Show( int x, int y )
      {
         int longestItem = Items.Max( i => i.ToString().Length );
         int menuWidth = longestItem + 6;
         int menuHeight = Items.Length;

         var underRegion = ConsoleContext.Read( x, y, Width, Height );

         CreateRegion( Width, Height, Items.Cast<string>().ToArray() );
         ConsoleContext.Render( _region, x, y );

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
                  SelectedIndex = ( SelectedIndex + 1 ) % Items.Length;
                  break;
               case ConsoleKey.UpArrow:
                  SelectedIndex = ( SelectedIndex + Items.Length - 1 ) % Items.Length;
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
            ConsoleContext.Render( _region, x, y );
         }

         ConsoleContext.Render( underRegion, x, y );

         if ( cancel )
         {
            return -1;
         }

         return SelectedIndex;
      }
   }
}
