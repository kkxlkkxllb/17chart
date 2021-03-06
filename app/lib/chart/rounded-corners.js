/**
 * Highcharts plugin for creating individual rounded corners.
 *
 * Author: Torstein Hønsi
 * Last revision: 2013-05-06
 * License: MIT License
 *
 * Known issues:
 * - Animation isn't working. To overcome that, create a method on the Renderer which points
 *   to a symbol definition, like it is currently done with "arc" in PieSeries.
 * - Dom exception on showing/hiding the series
 */
(function (H) {
    H.wrap(H.seriesTypes.column.prototype, 'translate', function (proceed) {
        var options = this.options,
            rTopLeft = options.borderRadiusTopLeft || 0,
            rTopRight = options.borderRadiusTopRight || 0,
            rBottomRight = options.borderRadiusBottomRight || 0,
            rBottomLeft = options.borderRadiusBottomLeft || 0,
            aTop = options.arrowTop || false;

        proceed.call(this);

        if (aTop) {
            H.each(this.points, function (point) {
                var shapeArgs = point.shapeArgs,
                    w = shapeArgs.width,
                    h = shapeArgs.height,
                    x = shapeArgs.x,
                    y = shapeArgs.y,
                    aTopLeft = w/2,
                    aTopRight = w/2;
                point.shapeType = 'path';
                point.shapeArgs = [
                    'M', x + aTopLeft, y,
                    // top side
                    'L', x + w - aTopRight, y,
                    // top right corner
                    'C', x + w - aTopRight , y, x + w, y + aTopRight , x + w, y + aTopRight,
                    // right side
                    'L', x + w, y + h - rBottomRight,
                    // bottom right corner
                    'C', x + w, y + h - rBottomRight / 2, x + w - rBottomRight / 2, y + h, x + w - rBottomRight, y + h,
                    // bottom side
                    'L', x + rBottomLeft, y + h,
                    // bottom left corner
                    'C', x + rBottomLeft / 2, y + h, x, y + h - rBottomLeft / 2, x, y + h - rBottomLeft,
                    // left side
                    'L', x, y + aTopLeft,
                    // top left corner
                    'C', x, y + aTopLeft , x + aTopLeft, y, x + aTopLeft, y,
                    'Z'
                ];

            });
        } else if (rTopLeft || rTopRight || rBottomRight || rBottomLeft) {
            H.each(this.points, function (point) {
                var shapeArgs = point.shapeArgs,
                    w = shapeArgs.width,
                    h = shapeArgs.height,
                    x = shapeArgs.x,
                    y = shapeArgs.y;
                point.shapeType = 'path';
                point.shapeArgs = [
                    'M', x + rTopLeft, y,
                    // top side
                    'L', x + w - rTopRight, y,
                    // top right corner
                    'C', x + w - rTopRight / 2, y, x + w, y + rTopRight / 2, x + w, y + rTopRight,
                    // right side
                    'L', x + w, y + h - rBottomRight,
                    // bottom right corner
                    'C', x + w, y + h - rBottomRight / 2, x + w - rBottomRight / 2, y + h, x + w - rBottomRight, y + h,
                    // bottom side
                    'L', x + rBottomLeft, y + h,
                    // bottom left corner
                    'C', x + rBottomLeft / 2, y + h, x, y + h - rBottomLeft / 2, x, y + h - rBottomLeft,
                    // left side
                    'L', x, y + rTopLeft,
                    // top left corner
                    'C', x, y + rTopLeft / 2, x + rTopLeft / 2, y, x + rTopLeft, y,
                    'Z'
                ];

            });
        }
    });
}(Highcharts));