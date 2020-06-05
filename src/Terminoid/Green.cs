using System;
using System.Diagnostics.CodeAnalysis;

namespace Terminoid
{
    [ExcludeFromCodeCoverage]
    public struct Green : IEquatable<Green>
    {
        public byte Value { get; }

        internal Green(byte value) => Value = value;

        public override int GetHashCode() => Value;

        public override bool Equals(object obj)
        {
            if (obj is Green green)
            {
                return Equals(green);
            }

            return false;
        }

        public bool Equals(Green other) => Value == other.Value;

        public static bool operator ==(Green lhs, Green rhs) => lhs.Equals(rhs);
        public static bool operator !=(Green lhs, Green rhs) => !lhs.Equals(rhs);
    }
}