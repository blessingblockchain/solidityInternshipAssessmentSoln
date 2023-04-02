pragma solidity ^0.5.16;

contract Hostel{

    address payable tenant;
    address payable Landlord;

    uint public no_of_rooms = 0;
    uint public no_of_agreement = 0;
    uint public no_of_rent =0;

    struct Room{
        uint roomid;
        uint agreementid;
        string roomname;
        string roomaddress;
        uint rent_per_month;
        uint securityDeposit;
        uint timestamp;
        bool vacant;
        address payable Landlord;
        address payable currentTenant;
    }

    mapping(uint => Room) public Room_by_No;

    struct RoomAgreement{
        uint roomid;
        uint agreementid;
        string Roomname;
        string RoomAddress;
        uint rent_per_month;
        uint securityDeposit;
        uint lockInPeriod;
        uint timestamp;
        address payable tenantAddress;
        address payable LandlordAddress;
    }

    mapping(uint => RoomAgreement) public RoomAgreement_by_No;

    struct Rent{
        uint rentno;
        uint roomid;
        uint agreementid;
        string Roomname;
        string Roomaddress;
        uint rent_per_month;
        uint timestamp;
        address payable tenantAddress;
        address payable LandlordAddress;
    }    

    mapping(uint => Rent) public Rent_by_No;

    modifier onlyLandlord(uint _index) {
        require(msg.sender == Room_by_No[_index].landlord, "Only landlord can access this");
        _;
       }

    modifier notLandlord(uint _index) {

        require(msg.sender != Room_by_No[_index].landlord, "Only Tenant can access this");
        _;
       }

    modifier OnlyWhileVacant(uint _index){

        require(Room_by_No[_index].vacant == true, "Room is currently occupied");
        _;
       }

    modifier enoughRent(uint _index) {
        require(msg.value >= uint(Room_by_No[_index].rent_per_month), "Not enough Ether in your wallet");
        _;
       }   

    modifier enoughAgreementfee(uint _index) {
        require(msg.value >= uint(uint(Room_by_No[_index].rent_per_month) + uint(Room_by_No[_index].securityDeposit)));
        _;
       }
    


}