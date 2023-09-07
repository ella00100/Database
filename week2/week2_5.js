const rangeInput = document.getElementById("js-range");
const guessForm = document.getElementById("js-guess");
const result = document.getElementById("js-result");

function generateRandomNumber(min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
}

const handlePrint = (e) => {
    e.preventDefault();

    const rangeMaxNum = parseInt(rangeInput.value);
    const randomNumber = generateRandomNumber(0, rangeMaxNum);
    const guessNum = parseInt(guessForm.querySelector("input").value); 
    
    const rangeSpan = document.querySelector("#js-title span");
    rangeSpan.innerHTML = `${rangeMaxNum}`
    
    const resultSpan = document.querySelector("#js-result span");

    if (guessNum === randomNumber) {
        resultSpan.innerHTML = `You choose: ${guessNum}, the machine choose: ${randomNumber}. <h3>You win!</h3>`;
    } else {
        resultSpan.innerHTML = `You choose: ${guessNum}, the machine choose: ${randomNumber}. <h3>You lose!</h3>`;
    }

};

guessForm.addEventListener("submit", handlePrint);
