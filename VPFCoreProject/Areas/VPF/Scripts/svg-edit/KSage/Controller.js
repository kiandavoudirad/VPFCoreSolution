
function changeColor(newColor) {
    var elem = document.getElementById("VPFTag");
    elem.style.color = newColor;
}

function GetDataObjectFromMVCController() {
    function DisplayData(Response) {
            if (Response.Data != null) {
               // if (LoadSvgEditIntoFrame())
                    LoadSVGData(Response.Data);

                return 1;
            }
            else return 0;
        }
    $.getJSON(GetUrl(), DisplayData);
    }




    function GetUrl() {
        
        var newUrlArray = window.location.pathname.split('/');
        var newURL = window.location.protocol + "//" + window.location.host + "/" + newUrlArray[0] + newUrlArray[1] + '/VPFCores/getData/' + newUrlArray[4];
        var callBackURL = newURL;
        return callBackURL;
    };



    function LoadSVGData(Data) {
        var svgexample = '<svg width="640" height="480" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns="http://www.w3.org/2000/svg"><g><title>Layer 1<\/title><rect stroke-width="5" stroke="#000000" fill="#FF0000" id="svg_1" height="35" width="51" y="35" x="32"/><ellipse ry="15" rx="24" stroke-width="5" stroke="#000000" fill="#0000ff" id="svg_2" cy="60" cx="66"/><\/g><\/svg>';
        var svgCanvas = null;
        var doc, frame;
        alert(Data);
        frame = document.getElementsByClassName("SVG_VPF")[0];
        doc = frame.contentWindow.document;
        try {
            svgCanvas = new EmbeddedSVGEdit(frame);
            console.log("This is the debugging tool");
            console.log(frame);
            console.log(svgCanvas);
            svgCanvas.setSvgString(Data);
            if (doc != null) {
                var Tools = [
                'tools_top', 'tools_left', 'tools_bottom', 'sidepanels', 'main_icon', 'rulers', 'sidepanels', 'canvashadow'
                ];
                for (i = 0; i < Tools.length; i++) {
                    doc.getElementById(Tools[i]).style.display = "none";
                }
            }
            return 1;
        } catch (e) {
            console.log("Waiting for iframe to load");

        }
    }



    function LoadSvgEditIntoFrame() {
        var Body = document.getElementById("VPFTag");
        if (Body != null) {
            var Element = document.createElement('iframe');
            Element.setAttribute("id", "SVG_VPF");
            Element.setAttribute("width", "1000px");
            Element.setAttribute("height", "800px");
            Element.setAttribute("class", "SVG_VPF");
            Element.setAttribute("src", "/Areas/VPF/Scripts/svg-edit/svg-editor.html");
            Body.appendChild(Element);
            return true;

        } else {
            return false;
        }
    }

    $(document).ready(function () {
        LoadSvgEditIntoFrame();

    });


    document.onreadystatechange = function () { if (document.readyState == "complete") { GetDataObjectFromMVCController();} }
