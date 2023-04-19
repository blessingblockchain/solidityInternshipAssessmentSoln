pragma solidity ^0.8.0;

contract LoanAgreement {
    address payable public lender;
    address payable public borrower;
    uint public loanAmount;
    uint public repaymentAmount;
    uint public interestRate;
    uint public loanDuration;
    uint public startDate;
    bool public loanApproved;
    bool public loanPaid;

    constructor() {
        lender = payable(msg.sender);
    }

    function requestLoan(uint _loanAmount) public {
        require(borrower == address(0), "Loan has already been requested.");
        borrower = payable(msg.sender);
        loanAmount = _loanAmount;
    }

    function inputLoanTerms(uint _repaymentAmount, uint _interestRate, uint _loanDuration) public {
        require(msg.sender == lender, "Only the lender can input loan terms.");
        repaymentAmount = _repaymentAmount;
        interestRate = _interestRate;
        loanDuration = _loanDuration;
        startDate = block.timestamp;
        loanApproved = true;
    }

    function repayLoan() public payable {
        require(msg.sender == borrower, "Only the borrower can repay the loan.");
        require(msg.value == repaymentAmount, "The repayment amount is incorrect.");

        lender.transfer(msg.value);
        loanPaid = true;
    }

    function calculateRepaymentAmount() public view returns (uint) {
        uint totalInterest = loanAmount * interestRate / 100;
        return loanAmount + totalInterest;
    }

    function calculateLoanDurationInDays() public view returns (uint) {
        return loanDuration * 30;
    }

    function isLoanOverdue() public view returns (bool) {
        if (block.timestamp > (startDate + calculateLoanDurationInDays() * 1 days)) {
            return true;
        } else {
            return false;
        }
    }

    function penaltyAmount() public view returns (uint) {
        uint overdueDays = (block.timestamp - startDate) / 1 days - calculateLoanDurationInDays();
        uint penaltyPercent = overdueDays * 1;
        uint penalty = repaymentAmount * penaltyPercent / 100;
        return penalty;
    }

    function seizeCollateral() public {
        require(msg.sender == lender, "Only the lender can seize collateral.");
        require(isLoanOverdue() == true, "Loan is not overdue.");

        borrower.transfer(penaltyAmount());
        lender.transfer(loanAmount);
        loanPaid = true;
    }

    function releaseLoan() public payable {
        require(msg.sender == lender, "Only the lender can release the loan.");
        require(msg.value == loanAmount, "The loan amount is incorrect.");
        require(loanApproved == true, "Loan has not been approved yet.");
        require(loanPaid == false, "The loan has already been paid.");

        borrower = payable(msg.sender);
        startDate = block.timestamp;
    }
    
    function deductLoan() public payable {
        require(msg.sender == borrower, "Only the borrower can deduct the loan.");
        require(msg.value == loanAmount, "The loan amount is incorrect.");
        require(loanPaid == false, "The loan has already been paid.");

        lender.transfer(msg.value);
        loanPaid = true;
    }
    
    function triggerPenalty() public {
        require(isLoanOverdue() == true, "Loan is not overdue.");
        require(loanPaid == false, "The loan has already been paid.");

        borrower.transfer(penaltyAmount());
        loanPaid = true;
    }
}
