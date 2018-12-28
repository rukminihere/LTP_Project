function SearchValidate() {
    var fname, lname, dob, namepattern, datepattern;
    var errorMessage = "";
    var isError = false;
    fname = document.getElementById('txtFirstName').value;
    lname = document.getElementById('txtLastName').value;
    namepattern = "^([a-zA-Z]+\\s*)+$";

    // First Name - Validation
    if (fname != '') {
        if (!fname.match(namepattern)) {
            isError = true;
            errorMessage = "First Name - Only letters and spaces allowed. Should not begin with space. \n";
        }
    }
    // Last Name - Validation
    if (lname != '') {
        if (!lname.match(namepattern)) {
            isError = true;
            errorMessage = errorMessage.concat("Last Name - Only letters and spaces allowed. Should not begin with space. \n");

        }
    }
   
    if (isError == true) {
        alert(errorMessage);
        return false;
    }
}
function AddPersonValidate() {
    var fname, lname, dob, namepattern, gender, datepattern;
    var errorMessage = "Error Details: \n";
    var isError = false;
    fname = document.getElementById('txtAddFirstName').value;
    lname = document.getElementById('txtAddLastName').value;
    dob = document.getElementById('txtAddDOB').value;
    gender = document.getElementById('rblAddGender');
    namepattern = "^([a-zA-Z]+\\s*)+$";

    // First Name - Validation
    if (fname != '') {
        if (!fname.match(namepattern)) {
            isError = true;
            errorMessage = errorMessage.concat("First Name - Only letters and spaces allowed. Should not begin with space. \n");
        }
    }
    else {
        isError = true;
        errorMessage = errorMessage.concat("First Name - Required. \n");
    }
    // Last Name - Validation
    if (lname != '') {
        if (!lname.match(namepattern)) {
            isError = true;
            errorMessage = errorMessage.concat("Last Name - Only letters and spaces allowed. Should not begin with space. \n");
        }
    }
    else {
        isError = true;
        errorMessage = errorMessage.concat("Last Name - Required. \n");
    }
    // Date of Birth - Validation
    if (dob = '') {        
        isError = true;
        errorMessage = errorMessage.concat("Date of Birth - Required. \n");
    }
    // Gender - Validation
    var inputs = gender.getElementsByTagName('input');
    var flag = false;
    for (var i = 0; i < inputs.length; i++) {
        if (inputs[i].checked) {
            flag = true;
            break;
        }
    }
    if (flag == false) {
        isError = true;
        errorMessage = errorMessage.concat("Gender - Required.\n");
    }

    if (isError == true) {
        alert(errorMessage);
        return false;
    }
}

function UpdatePersonValidate() {
    var fname, lname, dob, namepattern, gender, datepattern;
    var errorMessage = "Error Details: \n";
    var isError = false;
    fname = document.getElementById('txtEditFirstName').value;
    lname = document.getElementById('txtEditLastName').value;
    dob = document.getElementById('txtEditDOB').value;
    namepattern = "^([a-zA-Z]+\\s*)+$";

    // First Name - Validation
    if (fname != '') {
        if (!fname.match(namepattern)) {
            isError = true;
            errorMessage = errorMessage.concat("First Name - Only letters and spaces allowed. Should not begin with space. \n");
        }
    }
    else {
        isError = true;
        errorMessage = errorMessage.concat("First Name - Required. \n");
    }
    // Last Name - Validation
    if (lname != '') {
        if (!lname.match(namepattern)) {
            isError = true;
            errorMessage = errorMessage.concat("Last Name - Only letters and spaces allowed. Should not begin with space. \n");
        }
    }
    else {
        isError = true;
        errorMessage = errorMessage.concat("Last Name - Required. \n");
    }
    // Date of Birth - Validation
    if (dob = '') {        
        isError = true;
        errorMessage = errorMessage.concat("Date of Birth - Required. \n");
    }

    if (isError == true) {
        alert(errorMessage);
        return false;
    }
}

function ClearAddUpdatePersonDetails() {
    document.getElementById('txtAddFirstName').value = "";
    document.getElementById('txtAddLastName').value = "";
    document.getElementById('txtAddDOB').value = "";
    document.getElementById('txtAddDOB').SelectedIndex = 0;
    var gender = document.getElementById('rblAddGender');
    var inputs = gender.getElementsByTagName('input');
    for (var i = 0; i < inputs.length; i++) {
        if (inputs[i].checked) {
            inputs[i].checked = false;
        }
    }
}