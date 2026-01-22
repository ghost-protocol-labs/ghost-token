module ghst::ghst {
    use sui::coin::{Self, TreasuryCap};
    use sui::tx_context::{TxContext, sender};
    use sui::transfer;
    use std::option;

    /// Test-only Ghost token (GHST)
    /// --------------------------------------------------
    /// PURPOSE:
    /// - Wallet integration testing
    /// - Frontend development
    /// - Bridge simulations
    ///
    /// HARD RULES:
    /// - Never deploy to mainnet
    /// - Never bridge
    /// - Never listed
    /// - Never upgrade into production
    /// --------------------------------------------------

    /// One-Time Witness for GHST
    struct GHST has drop {}

    /// Initializes the GHST test token.
    /// Creates the currency and transfers the TreasuryCap
    /// to the transaction sender (test account).
    fun init(otw: GHST, ctx: &mut TxContext) {
        let treasury_cap = create_currency(otw, ctx);
        transfer::public_transfer(treasury_cap, sender(ctx));
    }

    /// Internal currency creation helper
    fun create_currency<T: drop>(
        otw: T,
        ctx: &mut TxContext
    ): TreasuryCap<T> {
        let (treasury_cap, metadata) = coin::create_currency(
            otw,
            9,                              // decimals
            b"GHST",                        // symbol
            b"Ghost Test Token",            // name
            b"Test-only token for Ghost Network development",
            option::none(),                 // no icon on-chain
            ctx
        );

        // Freeze metadata to prevent mutation
        transfer::public_freeze_object(metadata);
        treasury_cap
    }

    /// Mint GHST tokens to a recipient.
    ///
    /// SECURITY:
    /// - Requires mutable access to TreasuryCap
    /// - Intended for test environments only
    public entry fun mint(
        cap: &mut TreasuryCap<GHST>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(cap, amount, recipient, ctx);
    }

    /// Burn GHST tokens.
    ///
    /// Used to simulate burn paths during testing.
    public entry fun burn(
        cap: &mut TreasuryCap<GHST>,
        coin: coin::Coin<GHST>
    ) {
        coin::burn(cap, coin);
    }

    /// Test initializer helper
    #[test_only]
    public fun init_for_test(ctx: &mut TxContext) {
        init(GHST {}, ctx);
    }
}
