using System;
using NUnit.Framework;
using TechTalk.SpecFlow;
using TicTacToeCodestock.Core;

namespace TicTacToeCodestock.Specs
{
    [Binding]
    public class TicTacToeGameEngineSteps
    {
        private string[,] _board;
        private GameEngine _gameEngine = new GameEngine();
        private string _result;

        [Given(@"I have a tic tac toe board")]
        public void GivenIHaveATicTacToeBoard()
        {
            _board = new string[3, 3];
        }
        
        [Given(@"the board is empty")]
        public void GivenTheBoardIsEmpty()
        {
            _board = new string[3, 3] { { " ", " ", " " }, { " ", " ", " " }, { " ", " ", " " } };
        }
        
        [When(@"I determine who the winner is")]
        public void WhenIDetermineWhoTheWinnerIs()
        {
            _result = _gameEngine.GetWinner(_board);
        }
        
        [Then(@"there should be no winner")]
        public void ThenThereShouldBeNoWinner()
        {
            Assert.AreEqual(" ", _result);
        }

        [Given(@"the top row is a ""(.*)""")]
        public void GivenTheTopRowIsA(string p0)
        {
            _board[0, 0] = p0;
            _board[0, 1] = p0;
            _board[0, 2] = p0;
        }

        [Then(@"the winner is ""(.*)""")]
        public void ThenTheWinnerIs(string p0)
        {
            Assert.AreEqual(p0, _result);
        }

        [Given(@"the table looks like this")]
        public void GivenTheTableLooksLikeThis(Table table)
        {
            _board[0, 0] = table.Rows[0]["Col1"];
        }

    }
}
