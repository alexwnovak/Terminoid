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
}