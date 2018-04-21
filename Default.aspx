<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style3 {
            width: 2661px;
        }
        .auto-style4 {
            width: 297px;
        }
        .auto-style5 {
            width: 2869px;
        }
        .Header
    {
        background-color: darkblue;
        color: coral;    
        padding: 4px;
        font-weight: bold;
        }
        .SelectedHeader
        {
             background-color: palevioletred;
             color: white;
             padding: 4px;
             font-weight: bold;
             }
             .Contents
             {
                background-color: white;
                padding: 5px;
             }
                   .modalBackground
    {
        background-color: Black;
        filter: alpha(opacity=90);
        opacity: 0.8;
    }
         .modalPopup
          {
             background-color: #FFFFFF;
             border-width: 3px;
             border-style: solid;
             border-color: black;
             padding-top: 10px;
             padding-left: 10px;
             padding-right: 10px;
             padding-bottom: 10px;
             width: 600px;
             /*height: 230px;*/
         }
         * {box-sizing:border-box}
.mySlides {display:none}

/* Slideshow container */
.slideshow-container {
  max-width: 680px;
  position: relative;
  margin: auto;
}
/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  margin-top: -22px;
  padding: 16px;
  color: palevioletred;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .text {font-size: 11px}
}

/*--------------------------------------- 2*/
* {box-sizing:border-box}
.mySlides2 {display:none}

/* Slideshow container */
.slideshow2-container {
  max-width: 1000px;
  position: relative;
  margin: auto;
}

/* Caption text */

/* Number text (1/3 etc) */

/* The dots/bullets/indicators */
.dot2 {
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active2 {
  background-color: #717171;
}

/* Fading animation */
.fade2 {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

    </style>
<script type="text/javascript">
    //Hide's Doc Center when clicking outside

    function pageLoad(sender, args) {
        if (!args.get_isPartialLoad()) {
            $addHandler($find("MPE")._backgroundElement, "click", closePopup);
        }
    }

    function closePopup(e) {
        $find("MPE").hide();
    }

    //End
</script>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
      <div class="main">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <asp:LinkButton ID="lnkDummy" runat="server"></asp:LinkButton>
       <cc1:ModalPopupExtender ID="ModalPopupExtender1" BehaviorID="MPE" runat="server" PopupControlID="Panel1" TargetControlID="lnkDummy" BackgroundCssClass="modalBackground" CancelControlID = "ImageButton1">
        </cc1:ModalPopupExtender>   
 <asp:Panel ID="Panel1" runat="server"  CssClass="modalPopup" Style="display: none">  
   <div class="slideshow-container">
        <div class="right">
        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Styles/images/lightbox-btn-close.gif" />
        </div>
       
              <asp:Repeater ID="Repeater1" OnItemDataBound="R1_ItemDataBound" runat="server" DataSourceID="SqlDataSource1">
<%--<asp:DataList ID="DataList1" CssClass="center" runat="server" RepeatColumns="10" DataKeyField="id" DataSourceID="SqlDataSource1">--%>
    <ItemTemplate>
         
  <div class="mySlides fade">    
  <div class="numbertext" ></div>
      <%--<asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("location") %>' width="100%"/> --%>   
     <div class="center">
        <div id="Header" style="background-color: #C0C0C0">
      <div class="left"><b>No. of page: <asp:Label ID="Lblno" runat="server" Text=""></asp:Label></b></div><b>&nbsp GIS News&nbsp</b><br /><br />
        </div>
      <b><asp:Label ID="Label4" runat="server" Text='<%# Eval("date", "{0:dd/MM/yyyy}") %>'></asp:Label>&nbsp-&nbsp
      <asp:Label ID="Label2" runat="server" Text='<%# Eval("title") %>'></asp:Label></b><br />
         <asp:Image ID="Image1" runat="server" Width="100%" ImageUrl='<%# Eval("image") %>' />
      </div>
      <div style="padding: 20px 20px 0px 20px">
      <asp:Label ID="Label3" runat="server" Text='<%# Eval("desc") %>'></asp:Label>
      </div>
        
  <%--<img src="img/tm_tower.jpg" style="width:100%"/>--%>
  <div class="text"></div>  
      </div>     
    </ItemTemplate>

    <FooterTemplate>
        <div class="center">
            <asp:Label ID="defaultItem" runat="server" Visible='<%# Repeater1.Items.Count == 0 %>' Text="No News." />
        </div>
    </FooterTemplate>
<%--</asp:DataList>--%>
           </asp:Repeater>

     <!-- Next and previous buttons -->
  <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
  <a class="next" onclick="plusSlides(1)">&#10095;</a>  
</div>                
   <asp:ListView ID="ListView1" runat="server" OnItemDataBound="ListView1_ItemDataBound" DataSourceID="SqlDataSource1">
       <LayoutTemplate>
      <div style="text-align:center;">
      <div style="width:10%; margin: 0 auto; text-align:center;">
       <table style="width: 100%;">
        <tr>
           <asp:PlaceHolder ID="itemPlaceholder" runat="server"></asp:PlaceHolder>
        </tr>
        </table>
          </div>
           </div> 
    </LayoutTemplate>
     <ItemTemplate>
               <br />
         <div style="text-align:center">
            
            <td>
                <span class="dot"></span>   
            </td>
         </div>
        
    </ItemTemplate>
     </asp:ListView>
 <%--<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [News] Order"></asp:SqlDataSource>
 --%><script type="text/javascript">
     //Image slide show
     var slideIndex = 1;
     showSlides(slideIndex);

     // Next/previous controls
     function plusSlides(n) {
         showSlides(slideIndex += n);
     }

     // Thumbnail image controls
     function currentSlide(n) {
         showSlides(slideIndex = n);
     }

     function showSlides(n) {
         var i;
         var slides = document.getElementsByClassName("mySlides");
         var dots = document.getElementsByClassName("dot");
         if (n > slides.length) { slideIndex = 1 }
         if (n < 1) { slideIndex = slides.length }
         for (i = 0; i < slides.length; i++) {
             slides[i].style.display = "none";
         }
         for (i = 0; i < dots.length; i++) {
             dots[i].className = dots[i].className.replace(" active", "");
         }
         slides[slideIndex - 1].style.display = "block";
         dots[slideIndex - 1].className += " active";
     }
 </script>
 </asp:Panel>   
      <%--  <asp:Timer ID="Timer1" Interval="2000" runat="server" />--%>
          <table class="auto-style1">
              <tr>
                  <td>
<%--             <asp:UpdatePanel ID="up1" runat="server">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
            </Triggers>
            <ContentTemplate>
                <asp:AdRotator ID="AdRotator1" runat="server" AdvertisementFile="~/adrotator/iklan.xml" Height="450px" Width="510px" />
            </ContentTemplate>
        </asp:UpdatePanel>--%>

<div class="slideshow2-container">
    <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource3">
    <ItemTemplate>  
<div class="mySlides2 fade2">
 <%-- <div class="numbertext">1 / 3</div>--%>
    <div class="center">
         <asp:Image ID="Image1" runat="server" Width="100%" ImageUrl='<%# Eval("image") %>' AlternateText='<%# Eval("title") %>' />
      </div>
  <div class="text"></div>
</div>
  </ItemTemplate>
    <FooterTemplate>
        <div class="center">
            <asp:Label ID="defaultItem" runat="server" Visible='<%# Repeater1.Items.Count == 0 %>' Text="No Ad." />
        </div>
    </FooterTemplate>
 </asp:Repeater>
</div>
<asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource3">
       <LayoutTemplate>
      <div style="text-align:center;">
      <div style="width:10%; margin: 0 auto; text-align:center;">
       <table style="width: 100%;">
        <tr>
           <asp:PlaceHolder ID="itemPlaceholder" runat="server"></asp:PlaceHolder>
        </tr>
        </table>
          </div>
           </div> 
    </LayoutTemplate>
     <ItemTemplate>
               
         <div style="text-align:center">
            
            <td>
                <span class="dot2"></span>   
            </td>
         </div>
        
    </ItemTemplate>
     </asp:ListView>
<asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Ad]"></asp:SqlDataSource>
 
 <script type="text/javascript">
        var slideIndex2 = 0;
        showSlides2();

        function showSlides2() {
            var i;
            var slides = document.getElementsByClassName("mySlides2");
            var dots = document.getElementsByClassName("dot2");
            for (i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }
            slideIndex2++;
            if (slideIndex2 > slides.length) { slideIndex2 = 1 }
            for (i = 0; i < dots.length; i++) {
                dots[i].className = dots[i].className.replace(" active2", "");
            }
            slides[slideIndex2 - 1].style.display = "block";
            dots[slideIndex2 - 1].className += " active2";
            setTimeout(showSlides2, 2000); // Change image every 2 seconds
        }
 </script>
                </td>

                  <%-- Table column 2nd --%>
                  <td><div class ="center">
                  <marquee direction="left"><h2>Welcome to GIS Portal</h2></marquee> 
    <p>
        Sign in username using your staff ID  
    </p>
    </div>
    <cc1:Accordion ID="Accordion1" runat="server" HeaderCssClass="Header" ContentCssClass="Contents" HeaderSelectedCssClass="SelectedHeader" Font-Names="Verdana" Font-Size="10" BorderColor="#000000" BorderStyle="Solid" BorderWidth="1" FramesPerSecond="100"
FadeTransitions="true" TransitionDuration="500">
        <Panes>
    <cc1:AccordionPane ID="AccordionPane1" runat="server">
         <Header>Home</Header>
        <Content>
            There are 2 groups of registered users in GIS Portal : <br />System Administrator, and Staff who under GIS department.
        <br /><br />
GIS Portal consists of the following modules:<br /><br />

&nbsp&nbsp 1. Main Page<br />
&nbsp&nbsp 2. User Profile Management<br />
&nbsp&nbsp 3. Room Booking Management<br />
&nbsp&nbsp 4. Upload / Download Files <br /> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Management by Department<br />
&nbsp&nbsp 5. Photos Gallery Management<br />
&nbsp&nbsp 6. News Management<br />
        </Content>       
    </cc1:AccordionPane>
    <cc1:AccordionPane ID="AccordionPane2" runat="server">
         <Header>News</Header>
        <Content>
              <marquee direction="up"  onmouseover="this.stop()" onmouseout="this.start()" scrolldelay="300">
        <asp:DataList ID="DataList1" RepeatDirection="vertical" runat="server" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("title") %>' Font-Bold="True"></asp:Label>
                    <br />
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("date", "{0:dd/MM/yyyy}") %>'></asp:Label>
                    <p>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("desc") %>'></asp:Label>
                    </p>
                      
                </ItemTemplate>
            <footertemplate>
                     <asp:label visible="<%#bool.Parse((DataList1.Items.Count==0).ToString())%>" xmlns:asp="#unknown"
                     runat="server" ID="lblNoRecord" Text="No News."></asp:label>
        </footertemplate>
            </asp:DataList>
       </marquee>
        </Content>
    </cc1:AccordionPane>
          </Panes>  
        </cc1:Accordion>              
                  </td>
              </tr>
          </table>
           
          <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT TOP(10) * FROM [News] ORDER BY [date] DESC"></asp:SqlDataSource>
   </div>
     
</asp:Content>
