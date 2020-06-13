using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc;
using Quiz.Domain.Commands;
using Quiz.Domain.Entities;
using Quiz.Domain.Handlers;
using Quiz.Domain.Repositories;

namespace Quiz.Api.Controllers
{
    [ApiController]
    [Route("v1/questions")]
    public class QuestionController : ControllerBase
    {
    
        [Route("")]
        [HttpPost]
        public GenericCommandResult Create(
            [FromBody]CreateQuestionCommand command,
            [FromServices]QuestionHandler handler
        )
        {
            return (GenericCommandResult) handler.Handle(command);
        }

        [Route("")]
        [HttpGet]
        public IEnumerable<Question> GetAll(
            [FromServices]IQuestionRepository repository
        )
        {
            return repository.GetAll();
        }
    }
}