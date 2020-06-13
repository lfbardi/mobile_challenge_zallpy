using Flunt.Notifications;
using Quiz.Domain.Commands;
using Quiz.Domain.Commands.Contracts;
using Quiz.Domain.Entities;
using Quiz.Domain.Handlers.Contracts;
using Quiz.Domain.Repositories;

namespace Quiz.Domain.Handlers
{
    public class QuestionHandler : 
        Notifiable,
        IHandler<CreateQuestionCommand>
    {
       
        private readonly IQuestionRepository _repository;
        public QuestionHandler(IQuestionRepository repository)
        {
            _repository = repository;
        }
        public ICommandResult Handle(CreateQuestionCommand command)
        {
            command.Validate();
            if(command.Invalid)
                return new GenericCommandResult(false, "Ops, something went wrong", command.Notifications);

            var question = new Question(command.Title, command.CorrectAnswer, command.AnswerA,
                command.AnswerB, command.AnswerC, command.AnswerD);
            
            _repository.Create(question);

            return new GenericCommandResult(true, "Question created!", question);
        }
    }
}