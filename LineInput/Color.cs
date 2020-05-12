using System;

namespace LineInput
{
    public struct Color : IEquatable<Color>
    {
        public byte R { get; }
        public byte G { get; }
        public byte B { get; }

        public Color(byte r, byte g, byte b)
        {
            R = r;
            G = g;
            B = b;
        }

        public static Red Red(byte value) => new Red(value);

        public override bool Equals(object obj)
        {
            if (obj is Color color)
            {
                return Equals(color);
            }

            return false;
        }

        public override int GetHashCode() => (B << 16) | (G << 8) | R;

        public bool Equals(Color other)
        {
            return R == other.R && G == other.G && B == other.B;
        }

        public static bool operator ==(Color lhs, Color rhs) => lhs.Equals(rhs);
        public static bool operator !=(Color lhs, Color rhs) => !lhs.Equals(rhs);

        public static Color operator +(Color lhs, Color rhs)
        {
            int r = Math.Clamp(lhs.R + rhs.R, 0, 255);
            int g = Math.Clamp(lhs.G + rhs.G, 0, 255);
            int b = Math.Clamp(lhs.B + rhs.B, 0, 255);

            return new Color((byte)r, (byte)g, (byte)b);
        }

        public static Color operator +(Color lhs, Red rhs)
        {
            int r = Math.Clamp(lhs.R + rhs.Value, 0, 255);

            return new Color((byte)r, lhs.G, lhs.B);
        }
    }
}