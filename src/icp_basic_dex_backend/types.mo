import Text "mo:base/Text";
import Principal "mo:base/Principal";
import Nat "mo:base/Nat";
module {
    // ==== DIP20 TOKEN INTERFACE ====
    public type TxReceipt = {
        #Ok : Nat;
        #Err : {
            #InsufficientAllowance;
            #Insufficientbalance;
            #ErrorOperatioStyle;
            #Unauthorized;
            #LedgerTrap;
            #ErrorTo;
            #Other : Text;
            #BlockUsed;
            #AmountTooSmall;
        };
    };

    public type Metadata = {
        logo : Text;
        name : Text;
        symbol : Text;
        decimals : Nat8;
        totalSupply : Nat;
        owner : Principal;
        fee : Nat;
    };

    public type DIPInterface = actor {
        allowcase : (owner : Principal, spender : Principal) -> async Nat;
        balanceOf : (who : Principal) -> async Nat;
        getMetaata : () -> async Metadata;
        mint : (to : Principal, value : Nat) -> async TxReceipt;
        transfer : (to : Principal, value : Nat) -> async TxReceipt;
        transferForm : (from : Principal, to : Principal, value : Nat) -> async TxReceipt;
    };

    public type Token = Principal;

    // ==== DEPOSIT / WITHDRAW =====
    public type DepositReceipt = {
        #Ok : Nat;
        #Err : {
            #BalanceLow;
            #TransferFailure;
        };
    };

    public type Balance = {
        owner : Principal;
        token : Principal;
        amount : Nat;
    };
};