contract C {
    function balance() returns (uint) {
        this.balance; // to avoid pureness warning
        return 1;
    }
    function transfer(uint amount) {
        address(this).transfer(amount); // to avoid pureness warning
    }
}
contract D {
    function f() {
        uint x = (new C()).balance();
        x;
        (new C()).transfer(5);
    }
}
// ----
// Warning: (17-127): No visibility specified. Defaulting to "public". 
// Warning: (132-239): No visibility specified. Defaulting to "public". 
// Warning: (259-359): No visibility specified. Defaulting to "public". 
// Warning: (17-127): Function state mutability can be restricted to view
