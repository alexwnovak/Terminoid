using Xunit;
using FluentAssertions;
using LineInput;

public class VTRasterizerTests
{
    [Fact]
    public void GivenTheTextBufferIsEmpty_WhenRasterizing_TheOutputIsTheBlankCharacter()
    {
        var rasterizer = new VTRasterizer();

        string output = rasterizer.Rasterize(new TextBuffer());

        output.Should().Be(" ");
    }
}