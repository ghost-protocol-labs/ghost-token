#[test_only]
module ghst::ghst_tests {
    use ghst::ghst::{GHST, init_for_test};
    use sui::coin::{Self, TreasuryCap};
    use sui::test_scenario as ts;

    #[test]
    fun test_mint_and_burn() {
        let alice = @0xA;
        let bob = @0xB;

        let scenario = ts::begin(alice);
        {
            // Initialize GHST
            init_for_test(ts::ctx(&mut scenario));
        };

        ts::next_tx(&mut scenario, alice);
        {
            let cap = ts::take_from_sender<TreasuryCap<GHST>>(&scenario);

            // Mint to Bob
            coin::mint_and_transfer<GHST>(
                &mut cap,
                1_000_000_000,
                bob,
                ts::ctx(&mut scenario)
            );

            // Burn remaining supply (if any)
            let coin = coin::mint<GHST>(&mut cap, 100, ts::ctx(&mut scenario));
            coin::burn(&mut cap, coin);

            ts::return_to_sender(&scenario, cap);
        };

        ts::end(scenario);
    }

    #[test]
    fun test_multiple_mints() {
        let admin = @0xA;
        let user = @0xC;

        let scenario = ts::begin(admin);
        {
            init_for_test(ts::ctx(&mut scenario));
        };

        ts::next_tx(&mut scenario, admin);
        {
            let cap = ts::take_from_sender<TreasuryCap<GHST>>(&scenario);

            coin::mint_and_transfer<GHST>(
                &mut cap,
                500,
                user,
                ts::ctx(&mut scenario)
            );

            coin::mint_and_transfer<GHST>(
                &mut cap,
                500,
                user,
                ts::ctx(&mut scenario)
            );

            ts::return_to_sender(&scenario, cap);
        };

        ts::end(scenario);
    }
}
