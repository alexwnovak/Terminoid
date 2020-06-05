using System;
using System.Diagnostics.CodeAnalysis;

namespace Terminoid
{
    [ExcludeFromCodeCoverage]
    public class Blue : IEquatable<Blue>
    {
        public byte Value { get; }

        internal Blue(byte value) => Value = value;

        public override int GetHashCode() => Value;

        public override bool Equals(object obj)
        {
            if (obj is Blue blue)
            {
                return Equals(blue);
            }

            return false;
        }

        public bool Equals(Blue other) => Value == other.Value;

        public static bool operator ==(Blue lhs, Blue rhs) => lhs.Equals(rhs);
        public static bool operator !=(Blue lhs, Blue rhs) => !lhs.Equals(rhs);
    }
}