using System;
using System.Linq;

namespace Terminoid
{
   public class Menu
   {
      public object[] Items { get; }
      public int SelectedIndex { get; private set; }

      public int Width { get; }
      public int Height { get; }
      public char SelectionIndicator { get; set; } = '*';

      private Region _region;

      public Menu( object[] items )
      {
         Items = items;
      }

      private Region CreateRegion( int width, int height, string[] items )
      {
         _region = new Region( width, height );

         for ( int y = 0; y < _region.Height; y++ )
         {
            _region.FloodAttrLine( y, 8 << 4 | 15 );
            _region.SetLine( y, $"   {items[y]}" );
         }

         _region.SetChar( 1, SelectedIndex, SelectionIndicator );

         return _region;
      }

      private void UpdateRegion()
      {
         for ( int y = 0; y < Items.Length; y++ )
         {
            char indicatorOrBlank = SelectedIndex == y ? SelectionIndicator : ' ';
            _region.SetChar( 1, y, indicatorOrBlank );
         }
      }

      public int Show( int x, int y )
      {
         int longestItem = Items.Max( i => i.ToString().Length );
         int menuWidth = longestItem + 6;
         int menuHeight = Items.Length;

         var underRegion = RegionRenderer.Read( x, y, menuWidth, menuHeight );

         CreateRegion( menuWidth, menuHeight, Items.Cast<string>().ToArray() );
         RegionRenderer.Render( _region, x, y );

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
            RegionRenderer.Render( _region, x, y );
         }

         RegionRenderer.Render( underRegion, x, y );

         if ( cancel )
         {
            return -1;
         }

         return SelectedIndex;
      }
   }
}
