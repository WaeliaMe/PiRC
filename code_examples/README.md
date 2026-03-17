# Pi Hybrid Token Model Examples

This package provides example code for:

- Token allocation from project profits
- Reserve redistribution logic

## Installation

```bash
pip install pi_hybrid_examples
from pi_hybrid_examples import token_allocation, reserve_redistribution

# Example: allocate profit to different categories
total_profit = 1000000
liquidity, developers, reserve = token_allocation.allocate_profit(total_profit)
print("Liquidity:", liquidity)
print("Developers:", developers)
print("Reserve:", reserve)

# Example: redistribute reserve gradually
reserve_amount = 150000
liquidity, developers, reserve_amount = reserve_redistribution.redistribute_reserve(
    reserve_amount, liquidity, developers
)
print("After redistribution -> Liquidity:", liquidity, "Developers:", developers, "Reserve:", reserve_amount)

Feel free to fork this repository and create your own examples or improvements.
