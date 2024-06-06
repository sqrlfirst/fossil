use fossil::types::ProcessBlockOptions;
use starknet::{EthAddress, ContractAddress};

#[starknet::interface]
pub trait IL1HeadersStore<TState> {
    fn initialize(
        ref self: TState,
        l1_messages_origin: ContractAddress,
        admin: ContractAddress,
        offchain_processor: ContractAddress
    );
    fn set_offchain_processor(ref self: TState, offchain_processor: ContractAddress);
    fn receive_from_l1(ref self: TState, parent_hash: u256, block_number: u64);
    fn store_state_root(ref self: TState, block_number: u64, state_root: u256);
    fn store_many_state_roots(
        ref self: TState, start_block: u64, end_block: u64, state_roots: Array<u256>
    );
    fn get_initialized(self: @TState, block_number: u64) -> bool;
    fn get_parent_hash(self: @TState, block_number: u64) -> u256;
    fn get_latest_l1_block(self: @TState) -> u64;
    fn get_state_root(self: @TState, block_number: u64) -> u256;
}
