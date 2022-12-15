// Code generated by goctl. DO NOT EDIT!
// Source: hello.proto

package server

import (
	"context"

	"github.com/zouchangfu/goctlx/example/rpc/hello/internal/svc"
	"github.com/zouchangfu/goctlx/example/rpc/hello/pb/hello"
)

type GreetServer struct {
	svcCtx *svc.ServiceContext
	hello.UnimplementedGreetServer
}

func NewGreetServer(svcCtx *svc.ServiceContext) *GreetServer {
	return &GreetServer{
		svcCtx: svcCtx,
	}
}

func (s *GreetServer) SayHello(ctx context.Context, in *hello.HelloReq) (*hello.HelloResp, error) {
	l := greetlogic.NewSayHelloLogic(ctx, s.svcCtx)
	return l.SayHello(in)
}