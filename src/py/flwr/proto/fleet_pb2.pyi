"""
@generated by mypy-protobuf.  Do not edit manually!
isort:skip_file
"""
import builtins
import google.protobuf.descriptor
import google.protobuf.internal.containers
import google.protobuf.message
import typing
import typing_extensions

DESCRIPTOR: google.protobuf.descriptor.FileDescriptor

class Task(google.protobuf.message.Message):
    """GetTasks messages"""
    DESCRIPTOR: google.protobuf.descriptor.Descriptor
    ID_FIELD_NUMBER: builtins.int
    id: typing.Text
    def __init__(self,
        *,
        id: typing.Text = ...,
        ) -> None: ...
    def ClearField(self, field_name: typing_extensions.Literal["id",b"id"]) -> None: ...
global___Task = Task

class GetTasksRequest(google.protobuf.message.Message):
    DESCRIPTOR: google.protobuf.descriptor.Descriptor
    def __init__(self,
        ) -> None: ...
global___GetTasksRequest = GetTasksRequest

class GetTasksResponse(google.protobuf.message.Message):
    DESCRIPTOR: google.protobuf.descriptor.Descriptor
    TASK_FIELD_NUMBER: builtins.int
    @property
    def task(self) -> google.protobuf.internal.containers.RepeatedCompositeFieldContainer[global___Task]: ...
    def __init__(self,
        *,
        task: typing.Optional[typing.Iterable[global___Task]] = ...,
        ) -> None: ...
    def ClearField(self, field_name: typing_extensions.Literal["task",b"task"]) -> None: ...
global___GetTasksResponse = GetTasksResponse

class Result(google.protobuf.message.Message):
    """CreateResults messages"""
    DESCRIPTOR: google.protobuf.descriptor.Descriptor
    TASK_ID_FIELD_NUMBER: builtins.int
    task_id: typing.Text
    def __init__(self,
        *,
        task_id: typing.Text = ...,
        ) -> None: ...
    def ClearField(self, field_name: typing_extensions.Literal["task_id",b"task_id"]) -> None: ...
global___Result = Result

class CreateResultsRequest(google.protobuf.message.Message):
    DESCRIPTOR: google.protobuf.descriptor.Descriptor
    RESULTS_FIELD_NUMBER: builtins.int
    @property
    def results(self) -> google.protobuf.internal.containers.RepeatedCompositeFieldContainer[global___Result]: ...
    def __init__(self,
        *,
        results: typing.Optional[typing.Iterable[global___Result]] = ...,
        ) -> None: ...
    def ClearField(self, field_name: typing_extensions.Literal["results",b"results"]) -> None: ...
global___CreateResultsRequest = CreateResultsRequest

class CreateResultsResponse(google.protobuf.message.Message):
    DESCRIPTOR: google.protobuf.descriptor.Descriptor
    def __init__(self,
        ) -> None: ...
global___CreateResultsResponse = CreateResultsResponse
