//In prediction marketing, trading is split into shares.
// Each share pays out 100 wei if the answer resolves to Yes and 0 wei if the answer resovles to NO.
//The price per share reflects the market's possibility of resolving to YEs.
// If the price for the preceding market is 60, the market thinks there's
// a 60% probability that Ethereum will be above $2000 at
// else 
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
    
    function orderBuy(uint price) public payable
    {
        require(now <deadline);
        require(msg.value>0);
        require (price >= 0);
        require ( price< = 100);
        uint amount = msg.value/price;
        counter++;
        orders[counter] = Order(msg.sender, OrderType.Buy,amount,price);
        OrderPlaced(counter,msg.sender,OrderType.Buy,amount,price);
    }

    function orderSell(uint price, uint amount) public {
        require(now <deadline);
        require(shares[msg.sender] >=amount);
        require(price >=0);
        require(price <=100);


        shares[msg.sender]- = amount;
        counter++;
        orders[counter] = Order(msg.sender,orderType.Sell,amount,price);
        OrderPlaced(counter,msg.sender,OrderType.Sell,amount,price);
    }

    function tradeBuy(uint orderId) public payable
    {
        Order storage order = orders[orderId];
        require(now <deadline);
        require(order.user ! = msg.sender);
        require (order.orderType == OrderType.sell);
        require(order.amount > 0);
        require (msg.value >0);
        require (msg.value <= order.amount * order.price);
        uint amount = msg.value/order.price ;
        uint fee = (amount * order.price) * TX_FEE_NUMERATOR/TX_FEE_DENOMINATOR;
        uint feeShares = amount * TX_FEE_NUMERATOR / TX_FEE_DENOMINATOR;
        shares[msg.sender]+ = (amount-feeShares);
        shares[owner]+ = feeShares;
        balances[order.user]+ = (amount * order.price) -fee;
        balances[owner] + = fee;
        order.amount - = amount;
        if(order.amount == 0)
            delete orders[orderId];
        TradeMatched(orderId,msg.sender,amount);
    }


    function tradeSell(uint orderId,uint amount) public 
    {
        Order storage order = orders[orderId];
        require(now <deadline);
        require(order.user ! = msg.sender);
        require(order.orderType == OrderType.Buy);
        require(order.amount >0);
        require(amount < = order.amount);
        require(shares[msg.sender] >= amount);
        uint fee = (amount * order.price) 




