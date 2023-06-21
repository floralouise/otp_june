## Notes on the OTP Class
- theme of the class is Construct reduce convert

### Pipes

Once you know you can build things in this way, Elixir gets easier.

### The loop of your pipe =
- Prepare to work
- Show your work
- Do some work


### Design systems where
- All the program logic with certainty is in one place
- As long as we’re checking things that feed into a function, we can protect the core logic
- How to build things so you can spend more time in the core logic, and less time in the sad place with exception after exception

### Supervisors
- Start things
- Stop things
- Restart things
- Tiny little bit of extra stuff that sees if there’s a crash

### Elixir/Erlang is dynamically typed
- Can have type errors & that’s ok
- Ability to recover is what makes you a reliable system. It’s runtime that counts

Capitalization rules:
- File names = Snake case: everything lowercase with _ between words
- Module Names = Camel case: First letters of word are capitalize

## Elixir Processes
- Elixir is an actor-based language
- Follows the actor model
- The actor model
    - Mailbox that sends and receives
    - Model for communicating to processes in which a process has a mailbox. 
    - Messages of the same type in the order that they’re sent
    - And 2 different processes interact by sending each other messages (in Erlang: mostly) in order
- Current process has a PID
- Type self in iex to see the PID
- What does importing mean in elixir?
    - Bring in a function as if it was called locally
    - So you don’t need to add in all the modules
- Alias is just renaming something
- When you are looking at “self” in iex, you can see if the process is linked to anything
    - A parent process dies and if the child processes die, then try turning it off and on again
- Start another process: spawn worker
- When a process is done, it is not alive. (Shows as false)
    - Still has the same process ID, but not alive
    - It’s an address. The previous resident has moved (or moved on…)
    - Cannot come back to life
    - Bc elixir is immutable
- Use Process.alive?, provide the PID, and get information about it
    - Can reference the line of iex that had it v(number)
- you want processes to be linked because it's easier to reason about the design of systesm
- even if iex crashes, it has a supervises to be restarted

- if writing a supervisor, the life cycle manager (thing that notices a crash) needs something to be able to look up a user's state
- provide a place in the API to do that
- how to send a message in elixir? send
- express your intent in compiled code. way better than a comment.
- Process.info(iex) gets info about iex session
  - shows you the mailbox and how many messages is in it
- how to receive the message
  - receive do 
  - m -> m
  - end
- flush: shows all the messages that we sent

**Note:**
- lowercase atoms needs colons
  - [:uffda, :yall]
- uppercase atoms don't
  - [Uffda, Yall]

