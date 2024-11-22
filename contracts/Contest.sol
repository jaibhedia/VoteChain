pragma solidity 0.5.16;

contract Contest {
    address private admin;
    uint private contestantsCount;
    PHASE private state;
    enum PHASE { Reg, Voting, Done }
    
    struct Contestant {
        uint id;
        string name;
        uint voteCount;
        string party;
        uint age;
        string qualification;
    }

    struct Voter {
        bool hasVoted;
        uint vote;
        bool isRegistered;
    }

    mapping(uint => Contestant) private contestants;
    mapping(address => Voter) private voters;

    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can call this function");
        _;
    }

    modifier validState(PHASE x) {
        require(state == x, "Invalid state transition");
        _;
    }

    constructor() public {
        admin = msg.sender;
        state = PHASE.Reg;
    }

    function transitionToPhase(PHASE x) public onlyAdmin {
        require(uint(x) > uint(state), "Invalid state transition");
        state = x;
    }

    function addContestant(string memory _name, string memory _party, uint _age, string memory _qualification) public onlyAdmin validState(PHASE.Reg) {
        contestantsCount++;
        contestants[contestantsCount] = Contestant(contestantsCount, _name, 0, _party, _age, _qualification);
    }

    function registerVoter(address user) public onlyAdmin validState(PHASE.Reg) {
        voters[user].isRegistered = true;
    }

    function vote(uint _contestantId) public validState(PHASE.Voting) {
        require(voters[msg.sender].isRegistered, "Voter is not registered");
        require(!voters[msg.sender].hasVoted, "Voter has already voted");
        require(_contestantId > 0 && _contestantId <= contestantsCount, "Invalid contestant ID");
        
        contestants[_contestantId].voteCount++;
        voters[msg.sender].hasVoted = true;
        voters[msg.sender].vote = _contestantId;
    }
}
