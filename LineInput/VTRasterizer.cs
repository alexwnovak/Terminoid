namespace LineInput
{
    public class VTRasterizer : ITextRasterizer
    {
        public string Rasterize(TextBuffer textBuffer)
        {
            return textBuffer.ToFullString();
        }
    }
}