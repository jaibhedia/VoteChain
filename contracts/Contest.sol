pragma solidity 0.5.16;

contract Contest {
	
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

	address admin;
	mapping(uint => Contestant) public contestants;
	mapping(address => Voter) public voters;
	uint public contestantsCount;
	enum PHASE { reg, voting, done }
	PHASE public state;

	modifier onlyAdmin() {
		require(msg.sender == admin, "Only admin can perform this action");
		_;
	}
	
	modifier validState(PHASE x) {
	    require(state == x, "Invalid phase for this action");
	    _;
	}

	event ContestantAdded(uint id, string name);
	event VoterRegistered(address voter);
	event Voted(address voter, uint contestantId);

	constructor() public {
		admin = msg.sender;
		state = PHASE.reg;
	}

    function changeState(PHASE x) public onlyAdmin {
		require(uint(x) == uint(state) + 1, "Invalid state transition");
        state = x;
    }

	function addContestant(string memory _name, string memory _party, uint _age, string memory _qualification) public onlyAdmin validState(PHASE.reg) {
		contestantsCount++;
		contestants[contestantsCount] = Contestant(contestantsCount, _name, 0, _party, _age, _qualification);
		emit ContestantAdded(contestantsCount, _name);
	}

	function removeContestant(uint _id) public onlyAdmin validState(PHASE.reg) {
	    delete contestants[_id];
	}

	function voterRegisteration(address user) public onlyAdmin validState(PHASE.reg) {
		voters[user].isRegistered = true;
		emit VoterRegistered(user);
	}

	function deregisterVoter(address user) public onlyAdmin validState(PHASE.reg) {
	    delete voters[user];
	}

	function vote(uint _contestantId) public validState(PHASE.voting) {
		require(voters[msg.sender].isRegistered, "Voter is not registered");
		require(!voters[msg.sender].hasVoted, "Voter has already voted");
        require(_contestantId > 0 && _contestantId <= contestantsCount, "Invalid contestant ID");
		contestants[_contestantId].voteCount++;
		voters[msg.sender].hasVoted = true;
		voters[msg.sender].vote = _contestantId;
		emit Voted(msg.sender, _contestantId);
	}

	function getContestant(uint _id) public view returns (uint, string memory, uint, string memory, uint, string memory) {
	    Contestant memory c = contestants[_id];
	    return (c.id, c.name, c.voteCount, c.party, c.age, c.qualification);
	}
}
