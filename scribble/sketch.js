const num = 600;
const range = 500;

const ax = [];
const ay = [];

function setup() {
	createCanvas(window.innerWidth, window.innerHeight);
	for (let i = 0; i < num; i++) {
		ax[i] = width / 2;
		ay[i] = height / 2;
	}
	frameRate(60);
}

function draw() {
	background(51);

	for (let i = 1; i < num; i++) {
		ax[i - 1] = ax[i];
		ay[i - 1] = ay[i];
	}

	ax[num - 2] += random(-range, range);
	ay[num - 2] += random(-range, range);

	ax[num - 1] = constrain(ax[num - 1], 0, window.innerWidth);
	ay[num - 1] = constrain(ay[num - 1], 0, window.innerHeight);

	for (let j = 1; j < num; j++) {
		// Older lines have a lighter color
		const grayscale = j / num * 204.0 + 51;
		stroke(grayscale);
		line(ax[j - 1], ay[j - 1], ax[j], ay[j]);
	}
}
