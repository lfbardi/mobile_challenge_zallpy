using Flunt.Notifications;
using Flunt.Validations;
using Quiz.Domain.Entities.Contracts;

namespace Quiz.Domain.Commands
{
    public class CreateQuestionCommand : Notifiable, ICommand
    {
        public CreateQuestionCommand() {}

        public CreateQuestionCommand(string title, string correctAnswer, string company,
            string answerA, string answerB, string answerC, string answerD) {}

        public string Title { get; set; }
        public string CorrectAnswer { get; set; }
        public string Company { get; set; }
        public string AnswerA { get; set; }
        public string AnswerB { get; set; }
        public string AnswerC { get; set; }
        public string AnswerD { get; set; }

        public void Validate()
        {
            AddNotifications(
                new Contract()
                    .Requires()
                    .IsNotNullOrEmpty(Title, "title", "Title must not be null!")
                    .IsNotNullOrEmpty(CorrectAnswer, "correctAnswer", "Correct Answer must not be null!")
                    .IsNotNullOrEmpty(Company, "company", "Company must not be null")
                    .IsNotNullOrEmpty(AnswerA, "answer a", "Option A must not be null!")
                    .IsNotNullOrEmpty(AnswerB, "answer b", "Option B must not be null!")
                    .IsNotNullOrEmpty(AnswerC, "answer c", "Option C must not be null!")
                    .IsNotNullOrEmpty(AnswerD, "answer d", "Option D must not be null!")
            );
        }
    }
}