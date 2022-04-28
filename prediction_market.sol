contract PredictionMarket
{
    enum OrderType {Buy,Sell}
    enum Result {Open,Yes,No}


    struct Order
    {
        address user;
        OrderType orderType;
        uint amount;
        uint price;

    }


    uint public constant TX_FEE_NUMERATOR = 1;
    uint public constant TX_FEE_DENOMINATOR = 500;


    address public owner;
    Result public result;
    uint public deadline;
    uint public counter;
    uint public collateral;

    mapping(uint => Order) public orders;
    mapping(address => uint) public shares;
    mapping( address =>uint) public balances;


    event OrderPlaced (uint orderId,address user, OrderType
                       orderType,uint amount, uint price);
    event TradeMatched(uint orderId,address user,uint amount);
    event OrderCanceled(uint orderId);
    event Payout(address user,uint amount);


    function PredictionMarket(uint duration) public payable{
        require (msg.value>0);
        owner = msg.sender;
        deadline = now+duration;
        shares[msg.sender] = msg.value/100;
        collateral = msg.value;

    }



