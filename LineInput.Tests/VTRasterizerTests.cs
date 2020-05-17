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

    [Fact]
    public void GivenOneCharacterWasAdded_WhenRasterizing_TheOutputIsTheCharacterAndBlank()
    {
        var rasterizer = new VTRasterizer();

        var textBuffer = new TextBuffer();
        textBuffer.Append("A");

        string output = rasterizer.Rasterize(textBuffer);

        output.Should().Be("A ");
    }

    [Fact]
    public void GivenTheTextBufferIsEmptyWithABackgroundColor_WhenRasterizing_GeneratesTheCorrectOutput()
    {
        var rasterizer = new VTRasterizer();

        var textBuffer = new TextBuffer();
        textBuffer[0].Background = Color.FromRgb(10, 20, 30);

        string output = rasterizer.Rasterize(textBuffer);

        output.Should().Be("\x1B[48;2;10;20;30 ");
    }
}