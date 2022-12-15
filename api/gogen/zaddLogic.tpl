package {{.pkgName}}

import (
	{{.imports}}
)

type {{.logic}} struct {
	logx.Logger
	ctx    context.Context
	svcCtx *svc.ServiceContext
}

func New{{.logic}}(ctx context.Context, svcCtx *svc.ServiceContext) *{{.logic}} {
	return &{{.logic}}{
		Logger: logx.WithContext(ctx),
		ctx:    ctx,
		svcCtx: svcCtx,
	}
}

func (l *{{.logic}}) {{.function}}({{.request}}) error {
	{{.modelNaming}} := model.{{.modelName}}{}
	userId := utils.GetLoginUserId(l.ctx)
	{{.modelNaming}}.CreatedBy = userId
	{{.modelNaming}}.UpdatedBy = userId
	if err := copier.Copy(&{{.modelNaming}}, &req); err != nil {
		return errx.NewErrCode(errx.ServerCommonError)
	}
	if err := l.svcCtx.{{.modelName}}Dao.Save(&{{.modelNaming}}).Error; err != nil {
		return errx.NewErrCode(errx.DbError)
	}
	return nil
}
