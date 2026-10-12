// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// ScorePad 도전 과제 — struct · 인덱스 배열 · storage 실험을 한 컨트랙트로 통합한 참고 답안.
// 먼저 스스로 작성해 본 뒤 대조한다.
contract ScorePadChallenge {
    // ① struct로 확장 — 주소 → (이름 · 점수 · 활성)
    struct Student {
        string name;
        uint256 score;
        bool active;
    }

    mapping(address => Student) public students;
    address[] public allUsers;   // ② 키 목록 배열 — 매핑의 순회 불가를 보완

    event Registered(address user, string name);
    event ScoreAdded(address user, uint256 amount, uint256 newScore);

    // external 함수의 참조 타입 매개변수는 calldata로 받는다
    function register(string calldata name) external {
        require(!students[msg.sender].active, "already registered");  // 첫 등록 여부는 active로 판별
        students[msg.sender] = Student(name, 0, true);
        allUsers.push(msg.sender);                                     // 신규 등록 시에만 push
        emit Registered(msg.sender, name);
    }

    function addScore(uint256 amount) external {
        require(students[msg.sender].active, "not registered");
        require(amount > 0, "amount must be positive");
        students[msg.sender].score += amount;
        emit ScoreAdded(msg.sender, amount, students[msg.sender].score);
    }

    function userCount() external view returns (uint256) {
        return allUsers.length;
    }

    // ③ memory vs storage 실험 — 두 함수는 키워드 한 단어만 다르다.
    // 같은 주소로 각각 호출한 뒤 students(addr)로 score를 확인한다.
    function addPointMemory(address a) public {
        Student memory s = students[a];
        s.score += 10;  // 사본만 변경 — students[a].score는 그대로!
    }

    function addPointStorage(address a) public {
        Student storage s = students[a];
        s.score += 10;  // 원본 변경 — students[a].score = 기존값 + 10
    }
}
