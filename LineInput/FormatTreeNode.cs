using System.Collections.Generic;
using System.Text;

namespace LineInput
{
    internal abstract class FormatTreeNode
    {
        public List<FormatTreeNode> Children { get; } = new List<FormatTreeNode>();

        protected void EvaluateChildren(StringBuilder sb)
        {
            foreach (var node in Children)
            {
                node.Evaluate(sb);
            }
        }

        public abstract void Evaluate(StringBuilder sb);
    }
}