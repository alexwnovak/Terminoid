using Xunit;
using FluentAssertions;
using Terminoid;

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

        output.Should().Be("\x1B[48;2;10;20;30m ");
    }

    [Fact]
    public void GivenTheTextBufferHasOneCellWithAForegroundColor_WhenRasterizing_GeneratesTheCorrectOutput()
    {
        var rasterizer = new VTRasterizer();

        var textBuffer = new TextBuffer();
        textBuffer.Append(new Cell('A', Color.FromRgb(255, 192, 64)));

        string output = rasterizer.Rasterize(textBuffer);

        const string partOne = "\x1B[38;2;255;192;64mA";
        const string partTwo = "\x1B[39m ";

        output.Should().Be($"{partOne}{partTwo}");
    }
}