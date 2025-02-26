# Job Queue

Write a Ruby job queue that accepts a delay duration and a block.
Once the jobs have been added to the queue, provide a method to start the worker.

For example:

```
Task.enqueue(2.5)   { print 'world!' }
Task.enqueue(1.0) { print 'hello ' }

Task.work => 'hello world!'
```