# Imposter EOAs

> A contract is amogus 👀

Imposter EOAs is a library that helps create smart contracts that receive funds
via transfers to uninitialized CREATE2 contracts. Throughout the code these
uninitialized CREATE2 contracts may be referred to as IAs "imposter accounts".

Imposter EOAs enable good privacy and UX up-front, allowing users to deposit
funds into a contract by simply transferring funds to a specifically generated
address. On-chain such transfers look like ETH / ERC20 transfers to empty EOAs,
however funds are later recovered by some external contract via a CREATE2
deployment.
