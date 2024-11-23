let video;
let handPose;
let hands = [];

function preload() {
  handPose = ml5.handPose({ flipped: true });
}

function setup() {
  createCanvas(400, 400);
  video = createCapture(VIDEO, { flipped: true });
  video.hide();
  video.size(400, 400);

  handPose.detectStart(video, gotHands);
}

function draw() {
  background(220);
  image(video, 0, 0, width, height);

  if (hands.length > 0) {
    let index = hands[0].keypoints[8];
    let thumb = hands[0].keypoints[4];

    noFill();
    stroke(0, 255, 0);
    text('index', index.x, index.y);
    text('thumb', thumb.x, thumb.y);
  }

  // for (let i = 0; i < hands.length; i++) {
  //   for (let j = 0; j < hands[i].keypoints.length; j++) {
  //     let keypoint = hands[i].keypoints[j];
  //     fill(255, 255, 0);
  //     noStroke();
  //     //ellipse(keypoint.x, keypoint.y, 10, 10);
  //     text(i, keypoint.x - 10, keypoint.y);
  //     text(j, keypoint.x, keypoint.y);
  //   }
  // }
}

function gotHands(results) {
  hands = results;
}
