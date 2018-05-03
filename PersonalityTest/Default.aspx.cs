using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;

public partial class _Default : System.Web.UI.Page
{
    //This array keeps the value of answers for all questions
    //eg. answers[2] is holding the answer of question 3 which is from 1 to 5
    static int[] answers = new int[20];

    protected void Page_Load(object sender, EventArgs e)
    {
        lblYear.Text = DateTime.Today.Year.ToString();
    }

    protected void btnStart_Click(object sender, EventArgs e)
    {
        MultiView.ActiveViewIndex = 1;
        btnNext.Visible = true;
        RadioButtonList.Visible = true;
    }

    protected void btnPrevious_Click(object sender, EventArgs e)
    {
        //Navigating to the previous question with checking the situation for first and last question
        MultiView.ActiveViewIndex--;
        if (MultiView.ActiveViewIndex == 1)
            btnPrevious.Visible = false;
        if (MultiView.ActiveViewIndex == 19)
        {
            btnNext.Visible = true;
            btnResult.Visible = false;
        }
    }

    protected void btnNext_Click(object sender, EventArgs e)
    {
        //In order to save the answers we keep them in an array
        //we can use ActiveViewIndex-1 as our array subindex for current question
        answers[MultiView.ActiveViewIndex - 1] = Convert.ToInt32(RadioButtonList.SelectedValue);

        //Navigating to the next question with checking the situations for first and last question
        MultiView.ActiveViewIndex++;
        if (btnPrevious.Visible == false)
            btnPrevious.Visible = true;
        if (MultiView.ActiveViewIndex == 20)
        {
            btnNext.Visible = false;
            btnResult.Visible = true;
        }
    }

    protected void btnResult_Click(object sender, EventArgs e)
    {
        //saving the last answer before calculating the results
        answers[19] = Convert.ToInt32(RadioButtonList.SelectedValue);

        //navigating to the results
        MultiView.ActiveViewIndex++;
        RadioButtonList.Visible = false;
        btnPrevious.Visible = false;
        btnResult.Visible = false;

        //formula for calculating the results
        Results result = new Results();
        result.extroversion =         20 + answers[0] - answers[5] + answers[10] - answers[15];
        result.agreeableness =        20 - answers[1] + answers[6] - answers[11] + answers[16];
        result.conscientiousness =    20 + answers[2] - answers[7] + answers[12] - answers[17];
        result.neuroticism =          20 - answers[3] + answers[8] - answers[13] + answers[18];
        result.opennessToExperience = 20 + answers[4] - answers[9] + answers[14] - answers[19];

        //showing the results
        lblExtroversionScore.Text = result.extroversion.ToString();
        lblAgreeablenessScore.Text = result.agreeableness.ToString();
        lblConscientiousnessScore.Text = result.conscientiousness.ToString();
        lblNeuroticismScore.Text = result.neuroticism.ToString();
        lblOpennessToExperienceScore.Text = result.opennessToExperience.ToString();

        //showing the chart
        drawChart(result);
    }

    //sending data to JavaScript
    void drawChart(Results result)
    {
        ClientScriptManager cs = Page.ClientScript;
        cs.RegisterStartupScript(this.GetType(), "anything", "draw('" + result.extroversion + "','"
                                                                                + result.agreeableness + "','"
                                                                                + result.conscientiousness + "','"
                                                                                + result.neuroticism + "','"
                                                                                + result.opennessToExperience
                                                                                + "');", true);
    }
}