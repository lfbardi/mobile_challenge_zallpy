namespace Quiz.Domain.Entities
{
    public class Question : Entity
    {
        public Question(string title, string correctAnswer, string company, 
        string answerA, string answerB, string answerC, string answerD)
        {
            Title = title;
            CorrectAnswer = correctAnswer;
            Company = company;
            AnswerA = answerA;
            AnswerB = answerB;
            AnswerC = answerC;
            AnswerD = answerD;
        }
        public string Title { get; private set; }
        public string CorrectAnswer { get; private set; }
        public string Company { get; private set;}
        public string AnswerA { get; private set; }
        public string AnswerB { get; private set; }
        public string AnswerC { get; private set; }
        public string AnswerD { get; private set; }
        
    }
}