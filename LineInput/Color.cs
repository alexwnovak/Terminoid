using System;

namespace LineInput
{
    public readonly struct Color : IEquatable<Color>
    {
        public bool IsEmpty { get; }
        public byte R { get; }
        public byte G { get; }
        public byte B { get; }

        private Color(byte r, byte g, byte b, bool isEmpty)
        {
            IsEmpty = isEmpty;
            R = r;
            G = g;
            B = b;
        }

        public static Color FromRgb(byte r, byte g, byte b) => new Color(r, g, b, false);
        public static Color Empty() => new Color(0, 0, 0, true);

        public static Red Red(byte value) => new Red(value);
        public static Green Green(byte value) => new Green(value);
        public static Blue Blue(byte value) => new Blue(value);

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
            return R == other.R && G == other.G && B == other.B && IsEmpty == other.IsEmpty;
        }

        public override string ToString() => IsEmpty ? "(Empty)" : $"({R},{G},{B})";

        public static bool operator ==(Color lhs, Color rhs) => lhs.Equals(rhs);
        public static bool operator !=(Color lhs, Color rhs) => !lhs.Equals(rhs);

        public static Color operator +(Color lhs, Color rhs)
        {
            int r = Math.Clamp(lhs.R + rhs.R, 0, 255);
            int g = Math.Clamp(lhs.G + rhs.G, 0, 255);
            int b = Math.Clamp(lhs.B + rhs.B, 0, 255);

            return Color.FromRgb((byte)r, (byte)g, (byte)b);
        }

        public static Color operator -(Color lhs, Color rhs)
        {
            int r = Math.Clamp(lhs.R - rhs.R, 0, 255);
            int g = Math.Clamp(lhs.G - rhs.G, 0, 255);
            int b = Math.Clamp(lhs.B - rhs.B, 0, 255);

            return Color.FromRgb((byte)r, (byte)g, (byte)b);
        }

        public static Color operator +(Color lhs, Red rhs)
        {
            int r = Math.Clamp(lhs.R + rhs.Value, 0, 255);

            return Color.FromRgb((byte)r, lhs.G, lhs.B);
        }

        public static Color operator -(Color lhs, Red rhs)
        {
            int r = Math.Clamp(lhs.R - rhs.Value, 0, 255);

            return Color.FromRgb((byte)r, lhs.G, lhs.B);
        }

        public static Color operator +(Color lhs, Green rhs)
        {
            int g = Math.Clamp(lhs.G + rhs.Value, 0, 255);

            return Color.FromRgb(lhs.R, (byte)g, lhs.B);
        }

        public static Color operator -(Color lhs, Green rhs)
        {
            int g = Math.Clamp(lhs.G - rhs.Value, 0, 255);

            return Color.FromRgb(lhs.R, (byte)g, lhs.B);
        }

        public static Color operator +(Color lhs, Blue rhs)
        {
            int b = Math.Clamp(lhs.B + rhs.Value, 0, 255);

            return Color.FromRgb(lhs.R, lhs.G, (byte)b);
        }

        public static Color operator -(Color lhs, Blue rhs)
        {
            int b = Math.Clamp(lhs.B - rhs.Value, 0, 255);

            return Color.FromRgb(lhs.R, lhs.G, (byte)b);
        }
    }
}