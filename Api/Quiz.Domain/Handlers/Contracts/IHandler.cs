using Quiz.Domain.Commands.Contracts;
using Quiz.Domain.Entities.Contracts;

namespace Quiz.Domain.Handlers.Contracts
{
    public interface IHandler<T> where T : ICommand
    {
        ICommandResult Handle(T command);
    }
}