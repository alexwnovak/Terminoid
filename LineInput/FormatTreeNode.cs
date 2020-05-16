using System.Collections.Generic;
using System.Text;

namespace LineInput
{
    internal abstract class FormatTreeNode
    {
        public List<FormatTreeNode> Children { get; } = new List<FormatTreeNode>();

        public abstract void Evaluate(StringBuilder sb);
    }
}