
var minX = -0.68;
var minY = -0.41;
var maxitt = 500;
function setup() {

    createCanvas(1600, 1600);
    pixelDensity(1);
    loadPixels();
    for (var x = 0; x < width; x++) {
        for (var y = 0; y < height; y++) {

            var a = map(x, 0, width, minY, minX);
            var b = map(y, 0, height, minY, minX);

            var n = 0;
            var z = 0;

            var ca = a;
            var cb = b;

            while (n < maxitt) {

                var aa = a * a - b * b;
                var bb = 2 * a * b;

                a = aa + ca;
                b = bb + cb;

                if (abs(a + b) > 18) {
                    break;
                }

                n++;

            }

            var bright = map(n, 0, maxitt, 0, 1);
            bright = map(sqrt(bright), 0, 1, 0, 255);
            if (n === maxitt) {
                bright = 0;
            }

            var pix = ((x + y * width) * 4);
            pixels[pix + 0] = bright;
            pixels[pix + 1] = bright;
            pixels[pix + 2] = bright;
            pixels[pix + 3] = 255;
        }
    }
    updatePixels();

}


function draw() {
}