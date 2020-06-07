using System;
using System.Diagnostics.CodeAnalysis;

namespace Terminoid
{
    [ExcludeFromCodeCoverage]
    public struct Red : IEquatable<Red>
    {
        public byte Value { get; }

        internal Red(byte value) => Value = value;

        public override int GetHashCode() => Value;

        public override bool Equals(object obj)
        {
            if (obj is Red red)
            {
                return Equals(red);
            }

            return false;
        }

        public bool Equals(Red other) => Value == other.Value;

        public static bool operator ==(Red lhs, Red rhs) => lhs.Equals(rhs);
        public static bool operator !=(Red lhs, Red rhs) => !lhs.Equals(rhs);
    }
}