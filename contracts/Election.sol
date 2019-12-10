pragma solidity 0.5.12;

contract Election {
    // Model a Candidate
    struct Candidate {
        uint id;
        string name;
        uint space;
        bool matched;
        string ipAddress;
    }

    // Store accounts that have voted
    //mapping(address => bool) public voters;

    // Store Candidates
    // Fetch Candidate
    mapping(uint => Candidate) public candidates;
    // Store Candidates Count
    uint public candidatesCount;

    // voted event
    event votedEvent (
        uint indexed _candidateId
    );

    event addedEvent(
        uint indexed _candidateId
    );

    // constructor () public {
    //     addCandidate("Provider 1", 5, "13.456.199.54");
    //     addCandidate("Provider 2", 2, "13.456.199.55");
    //     addCandidate("Provider 3", 10, "13.456.199.56");
    // }

    function addCandidate (string memory _name, uint _space, string memory _ipAddress) public {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, _space, false, _ipAddress);
    }

    function vote (uint _candidateId) public {
        // require that they haven't voted before
        //require(!voters[msg.sender]);

        // require a valid candidate
        require(_candidateId > 0 && _candidateId <= candidatesCount);

        // record that voter has voted
        //voters[msg.sender] = true;

        // update candidate vote Count
        candidates[_candidateId].matched = true;

        // trigger voted event
        emit votedEvent(_candidateId);
    }
}
