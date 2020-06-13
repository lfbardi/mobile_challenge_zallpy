using Flunt.Notifications;
using Flunt.Validations;
using Quiz.Domain.Entities.Contracts;

namespace Quiz.Domain.Commands
{
    public class CreateQuestionCommand : Notifiable, ICommand
    {
        public CreateQuestionCommand() {}

        public CreateQuestionCommand(string title, string correctAnswer,
            string answerA, string answerB, string answerC, string answerD) {}

        public string Title { get; set; }
        public string CorrectAnswer { get; set; }
        public string AnswerA { get; set; }
        public string AnswerB { get; set; }
        public string AnswerC { get; set; }
        public string AnswerD { get; set; }

        public void Validate()
        {
            AddNotifications(
                new Contract()
                    .Requires()
                    .IsNotNullOrEmpty(Title, "title", "Title must not me null!")
                    .IsNotNullOrEmpty(CorrectAnswer, "correctAnswer", "Correct Answer must not me null!")
                    .IsNotNullOrEmpty(AnswerA, "answer a", "Option A must not me null!")
                    .IsNotNullOrEmpty(AnswerB, "answer b", "Option B must not me null!")
                    .IsNotNullOrEmpty(AnswerC, "answer c", "Option C must not me null!")
                    .IsNotNullOrEmpty(AnswerD, "answer d", "Option D must not me null!")
            );
        }
    }
}