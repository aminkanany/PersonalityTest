<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <!--META-->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <!-- FONTS -->
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet" />

    <!--JQUERY-->
    <script src="Scripts/jquery-1.9.1.min.js"></script>

    <!-- BOOTSTRAP -->
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.js"></script>

    <!-- CSS -->
    <link href="resources/css/main.css" rel="stylesheet" />

    <!--CHART-->
    <script src="https://www.gstatic.com/charts/loader.js"></script>
    <script src="Scripts/MyChart.js"></script>

    <title>Personality Test</title>
</head>
<body>
    <div class="bg">
        <form id="form1" runat="server">
            <div class="mainPanel">
                <asp:MultiView ID="MultiView" runat="server" ActiveViewIndex="0">
                    <asp:View ID="View0" runat="server">
                        <h1>Big Five Personality Test</h1>
                        <br />
                        <p>
                            This is a personality test, it will help you understand why you act the way that you do and how your personality is structured.<br />
                            Please answer to the next 50 question with one of the choices of disagree, slightly disagree, neutral, slightly agree or agree.<br />
                            When you are ready press START to begin! 
                        </p>
                        <div class="btn center-block">
                            <asp:Button ID="btnStart" runat="server" Text="START" OnClick="btnStart_Click" />
                        </div>
                        <hr />
                        <p>This is a demonstration website and you should not use the results of the personality questionnaire for any serious purpose.  Personality questionnaires can be used for personal guidance or job selection but should be administered and interpreted by a qualified psychologist.</p>
                    </asp:View>
                    <asp:View ID="View1" runat="server">
                        <p>1. I am the life of the party.</p>
                    </asp:View>
                    <asp:View ID="View2" runat="server">
                        <p>2. I feel little concern for others.</p>
                    </asp:View>
                    <asp:View ID="View3" runat="server">
                        <p>3. I am always prepared.</p>
                    </asp:View>
                    <asp:View ID="View4" runat="server">
                        <p>4. I get stressed out easily.</p>
                    </asp:View>
                    <asp:View ID="View5" runat="server">
                        <p>5. I have a rich vocabulary.</p>
                    </asp:View>
                    <asp:View ID="View6" runat="server">
                        <p>6. I don't talk a lot.</p>
                    </asp:View>
                    <asp:View ID="View7" runat="server">
                        <p>7. I am interested in people.</p>
                    </asp:View>
                    <asp:View ID="View8" runat="server">
                        <p>8. I leave my belongings around.</p>
                    </asp:View>
                    <asp:View ID="View9" runat="server">
                        <p>9. I am relaxed most of the time.</p>
                    </asp:View>
                    <asp:View ID="View10" runat="server">
                        <p>10. I have difficulty understanding abstract ideas.</p>
                    </asp:View>
                    <asp:View ID="View11" runat="server">
                        <p>11. I feel comfortable around people.</p>
                    </asp:View>
                    <asp:View ID="View12" runat="server">
                        <p>12. I insult people.</p>
                    </asp:View>
                    <asp:View ID="View13" runat="server">
                        <p>13. I pay attention to details.</p>
                    </asp:View>
                    <asp:View ID="View14" runat="server">
                        <p>14. I worry about things.</p>
                    </asp:View>
                    <asp:View ID="View15" runat="server">
                        <p>15. I have a vivid imagination.</p>
                    </asp:View>
                    <asp:View ID="View16" runat="server">
                        <p>16. I keep in the background.</p>
                    </asp:View>
                    <asp:View ID="View17" runat="server">
                        <p>17. I sympathize with others' feelings.</p>
                    </asp:View>
                    <asp:View ID="View18" runat="server">
                        <p>18. I make a mess of things.</p>
                    </asp:View>
                    <asp:View ID="View19" runat="server">
                        <p>19. I seldom feel blue.</p>
                    </asp:View>
                    <asp:View ID="View20" runat="server">
                        <p>20. I am not interested in abstract ideas.</p>
                    </asp:View>
                    <asp:View ID="View21" runat="server">
                        <h1>Your personality result</h1>
                        <div id="chart_div" class="center-block"></div>
                        <div>
                            <asp:Label ID="lblExtroversion" runat="server" Text="Extroversion: "></asp:Label>
                            <asp:Label ID="lblExtroversionScore" runat="server" Text=""></asp:Label><br />
                            <asp:Label ID="lblAgreeableness" runat="server" Text="Agreeableness: "></asp:Label>
                            <asp:Label ID="lblAgreeablenessScore" runat="server" Text=""></asp:Label><br />
                            <asp:Label ID="lblConscientiousness" runat="server" Text="Conscientiousness: "></asp:Label>
                            <asp:Label ID="lblConscientiousnessScore" runat="server" Text=""></asp:Label><br />
                            <asp:Label ID="lblNeuroticism" runat="server" Text="Neuroticism: "></asp:Label>
                            <asp:Label ID="lblNeuroticismScore" runat="server" Text=""></asp:Label><br />
                            <asp:Label ID="lblOpennessToExperience" runat="server" Text="Openness To Experience: "></asp:Label>
                            <asp:Label ID="lblOpennessToExperienceScore" runat="server" Text=""></asp:Label><br />
                            <h6>*These Scores are out of 40</h6>
                        </div>
                        <div>
                            <div class="btn center-block">
                                <input id="btnHelp" type="button" value="What These mean?" class="btn btn-info btn-lg" data-toggle="modal" data-target="#help" />
                            </div>
                            <!-- Modal -->
                            <div id="help" class="modal fade" role="dialog">
                                <div class="modal-dialog">
                                    <!-- Modal content-->
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">Result Help</h4>
                                        </div>
                                        <div class="modal-body">
                                            <p>
                                                <strong>Extroversion</strong> is the personality trait of seeking fulfillment from sources outside the self or in community. High scorers tend to be very social while low scorers prefer to work on their projects alone.<br />
                                                <br />
                                                <strong>Agreeableness</strong> reflects much individuals adjust their behavior to suit others. High scorers are typically polite and like people. Low scorers tend to 'tell it like it is'.<br />
                                                <br />
                                                <strong>Conscientiousness</strong> is the personality trait of being honest and hardworking. High scorers tend to follow rules and prefer clean homes. Low scorers may be messy and cheat others.<br />
                                                <br />
                                                <strong>Neuroticism</strong> is the personality trait of being emotional.<br />
                                                <br />
                                                <strong>Openness to Experience</strong> is the personality trait of seeking new experience and intellectual pursuits. High scores may day dream a lot. Low scorers may be very down to earth.
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </asp:View>
                </asp:MultiView>
                <asp:RadioButtonList ID="RadioButtonList" runat="server" Visible="False">
                    <asp:ListItem Value="1"> Disagree</asp:ListItem>
                    <asp:ListItem Value="2"> Slightly Disagree</asp:ListItem>
                    <asp:ListItem Value="3" Selected="True"> Neutral</asp:ListItem>
                    <asp:ListItem Value="4"> Slightly Agree</asp:ListItem>
                    <asp:ListItem Value="5"> Agree</asp:ListItem>
                </asp:RadioButtonList>
                <asp:Button ID="btnPrevious" runat="server" Text="Previous" Visible="False" OnClick="btnPrevious_Click" />
                <asp:Button ID="btnNext" runat="server" Text="Next" Visible="False" OnClick="btnNext_Click" />
                <asp:Button ID="btnResult" runat="server" Text="Finish" OnClick="btnResult_Click" Visible="False" />
            </div>
        </form>
    </div>

    <footer>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <span class="copyright">Copyright &copy; Amin Kanani
                        <asp:Label ID="lblYear" runat="server" Text=""></asp:Label></span>
                </div>
            </div>
        </div>
    </footer>

</body>
</html>
