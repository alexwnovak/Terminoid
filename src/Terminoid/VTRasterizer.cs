namespace Terminoid
{
    public class VTRasterizer : ITextRasterizer
    {
        public string Rasterize(TextBuffer textBuffer)
        {
            var formatTree = new FormatTree(textBuffer);
            return formatTree.Evaluate();
        }
    }
}