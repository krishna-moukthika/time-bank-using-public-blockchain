pragma solidity ^0.5.1; 

contract UserData {
    struct User {
        string name;
        address uaddr;
        string location;
        string skills;
        string user_role;
    }
    struct JobDetails {
        string jobTitle;
        address writtenBy;
        uint256 timestamp;
        string jobDetails;
    }
    // Each address is linked to a user with name, location and skills
    mapping(address => User) public users;
    // The jobs that each address has
    mapping(address => JobDetails[]) public userJobs;
    JobDetails[] public jobs;
    // Sets the profile of a user
    function setProfile(string memory _name, address _uaddr, string memory _location, string memory _skills, string memory _userRole) public {
       // User memory user = User(_name, _uaddr, _location, _skills, _userRole);
        users[_uaddr].uaddr = _uaddr;
        users[_uaddr].name = _name;
        users[_uaddr].location = _location;
        users[_uaddr].skills = _skills;
        users[_uaddr].user_role = _userRole;
        //userInfo[msg.sender] = user;
    }
    function userInfo (address _uaddr) view public returns (string memory, address, string memory, string memory, string memory) {
        
        return (users[_uaddr].name, users[_uaddr].uaddr, users[_uaddr].location, users[_uaddr].skills, users[_uaddr].user_role);
    }
    // Adds a new job
    function postJob(string memory _jobTitle, string memory _jobDetails) public {
        JobDetails memory job = JobDetails(_jobTitle, msg.sender, now,  _jobDetails); 
        userJobs[msg.sender].push(job);
        jobs.push(job);
    }
    function jobInfo (uint256 jid) view public returns (string memory, address, string memory) {
        
        return (jobs[jid].jobTitle, jobs[jid].writtenBy, jobs[jid].jobDetails);
    }
}



