using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace T3.Activitats
{
    public class PaymentCard
    {
        public double Balance { get;  set; }
        public PaymentCard(int balance)
        {
            this.Balance = balance;
        }
        public override string ToString()
        {
            return $"The card has a balance of {this.Balance} euros";
        }
    }
}
