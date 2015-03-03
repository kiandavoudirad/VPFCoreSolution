

function save(data,error) {
        frame = document.getElementsByClassName("SVG_VPF")[0];
        doc = frame.contentWindow.document;
        svgCanvas = new EmbeddedSVGEdit(frame);
        console.log("This is the debugging tool");
        console.log(frame);
        console.log(svgCanvas);
        svgCanvas.getSvgString()(function handleSvgData(data, error) {
            if (error) {
                alert('error ' + error);
            } else {
                alert('Congratulations. Your SVG string is back in the host page, do with it what you will\n\n' + data);
            }
        });
};
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


function LoadButtons() {
    var Body = document.getElementById("Save");
    var save = document.createElement("u");
    save.setAttribute("id", "Save");
    var _Save = document.createTextNode("Save");
    save.appendChild(_Save);
    Body.appendChild(save);

}


$(document).ready(function (App) {


    var options = {'APTransaction':'10813'};
        form = document.getElementById("ModuleSelector");
   

        App.Load = (function () {
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
        });


        App.LoadForm = function () {
            
            if (form != null)
            {
                var select = document.createElement("select"); //input element, text
              
                  document.createElemetn("option");
              
                i.setAttribute('type', "Select Your module to be created?");
                i.setAttribute('name', "username");
                i++;


            }

        };
        

    App.Load();

    alert(_formSelector);
    // App.LoadForm();
});
